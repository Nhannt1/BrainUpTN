import 'dart:async';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_bloc.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_event.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/bloc/group_member_state.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/model/model_member.dart';
import 'package:brainup/presentation/pages/your_group/widget/provider_group_member/repository/member_repository.dart'; // <-- THÊM import này
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GroupMembers extends StatelessWidget {
  final String subjectId; // ví dụ: "Math"
  final String gradeId; // ví dụ: "grade_6"

  const GroupMembers({
    super.key,
    required this.subjectId,
    required this.gradeId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GroupMembersBloc, GroupMembersState>(
      builder: (context, state) {
        if (state is GroupMembersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GroupMembersLoaded) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header + nút Add
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Group Members',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                      onTap: () => _openAddByNameSheet(context, state),
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          'Add +',
                          style: TextStyle(
                            color: Color(0xFF7C3AED),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                if (state.members.isEmpty)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey.shade200),
                    ),
                    child:
                        const Text('Chưa có thành viên. Nhấn "Add +" để thêm.'),
                  ),

                ...state.members.map((m) => _MemberCard(member: m)).toList(),
              ],
            ),
          );
        } else if (state is GroupMembersError) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Text('Error: ${state.message}'),
          );
        } else {
          return const SizedBox.shrink();
        }
      },
    );
  }

  // Mở BottomSheet tìm theo TÊN
  void _openAddByNameSheet(BuildContext context, GroupMembersState state) {
    // lấy các uid đã là member để disable trong list
    final existingUids = (state is GroupMembersLoaded)
        ? state.members.map((m) => m.id).toSet()
        : <String>{};

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => _AddMemberByNameSheet(
        subjectId: subjectId,
        gradeId: gradeId,
        existingUids: existingUids,
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  final Member member;

  const _MemberCard({required this.member});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage:
                member.avatar.isNotEmpty ? NetworkImage(member.avatar) : null,
            child: member.avatar.isEmpty ? const Icon(Icons.person) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${member.completion}% completed',
                  style: TextStyle(color: Colors.grey.shade600),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Icon(
                Icons.circle,
                color: member.status == MemberStatus.active
                    ? Colors.green
                    : Colors.orange,
                size: 10,
              ),
              const SizedBox(width: 4),
              Text(
                member.status == MemberStatus.active ? 'Active' : 'Away',
                style: TextStyle(
                  color: member.status == MemberStatus.active
                      ? Colors.green
                      : Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// BottomSheet: TÌM THEO TÊN → CHỌN → ADD
class _AddMemberByNameSheet extends StatefulWidget {
  final String subjectId;
  final String gradeId;
  final Set<String> existingUids; // để disable user đã là member

  const _AddMemberByNameSheet({
    required this.subjectId,
    required this.gradeId,
    required this.existingUids,
  });

  @override
  State<_AddMemberByNameSheet> createState() => _AddMemberByNameSheetState();
}

class _AddMemberByNameSheetState extends State<_AddMemberByNameSheet> {
  final _controller = TextEditingController();
  final _repo = GroupMemberRepository();
  Timer? _debounce;
  bool _loading = false;
  bool _loadingMore = false;

  List<UserLite> _items = []; // danh sách đang hiển thị
  String? _lastNameLowerForSuggestion; // phân trang gợi ý
  bool get _searching => _controller.text.trim().isNotEmpty;

  @override
  void initState() {
    super.initState();
    _loadSuggestionsFirstPage(); // <-- khi mở sheet, load gợi ý luôn
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _controller.dispose();
    super.dispose();
  }

  // GỢI Ý TRANG ĐẦU (chưa gõ gì)
  Future<void> _loadSuggestionsFirstPage() async {
    setState(() {
      _loading = true;
      _items = [];
      _lastNameLowerForSuggestion = null;
    });
    try {
      final rs = await _repo.listUsersNotInGroup(
        subject: widget.subjectId,
        grade: widget.gradeId,
        limit: 20,
      );
      if (!mounted) return;
      setState(() {
        _items = rs;
        _loading = false;
        if (rs.isNotEmpty) {
          final last = rs.last;
          _lastNameLowerForSuggestion =
              (last.name.isNotEmpty ? last.name.toLowerCase() : '');
        }
      });
    } catch (e) {
      if (!mounted) return;
      setState(() => _loading = false);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Load suggestions error: $e')),
      );
    }
  }

  // GỢI Ý – TẢI THÊM KHI CUỘN
  Future<void> _loadMoreSuggestions() async {
    if (_loadingMore || _searching) return;
    setState(() => _loadingMore = true);
    try {
      final rs = await _repo.listUsersNotInGroup(
        subject: widget.subjectId,
        grade: widget.gradeId,
        limit: 20,
        startAfterNameLower: _lastNameLowerForSuggestion,
      );
      if (!mounted) return;
      setState(() {
        _items.addAll(rs);
        _loadingMore = false;
        if (rs.isNotEmpty) {
          final last = rs.last;
          _lastNameLowerForSuggestion = (last.name.isNotEmpty
              ? last.name.toLowerCase()
              : _lastNameLowerForSuggestion);
        }
      });
    } catch (_) {
      if (!mounted) return;
      setState(() => _loadingMore = false);
    }
  }

  // TÌM THEO TÊN (lọc bỏ member)
  void _onQueryChanged(String q) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () async {
      final text = q.trim();
      if (text.isEmpty) {
        // quay về danh sách gợi ý
        _loadSuggestionsFirstPage();
        return;
      }
      setState(() => _loading = true);
      try {
        final rs = await _repo.searchUsersByNamePrefixNotInGroup(
          subject: widget.subjectId,
          grade: widget.gradeId,
          query: text,
          limit: 40,
        );
        if (!mounted) return;
        setState(() {
          _items = rs;
          _loading = false;
        });
      } catch (e) {
        if (!mounted) return;
        setState(() => _loading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Search error: $e')),
        );
      }
    });
  }

  void _add(String uid) {
    context.read<GroupMembersBloc>().add(
          AddMemberRequested(
            subject: widget.subjectId,
            grade: widget.gradeId,
            uid: uid,
          ),
        );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;
    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.85,
          child: Column(
            children: [
              const SizedBox(height: 8),
              Container(
                  width: 44,
                  height: 4,
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 8),
              const Text('Thêm thành viên',
                  style: TextStyle(fontWeight: FontWeight.w700)),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextField(
                  controller: _controller,
                  autofocus: true, // 👈 giúp nhập ngay
                  onChanged: _onQueryChanged,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Nhập tên (prefix)…',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              if (_loading) const LinearProgressIndicator(),
              Expanded(
                child: _items.isEmpty && !_loading
                    ? Center(
                        child: Text(
                          _searching
                              ? 'Không tìm thấy kết quả cho "${_controller.text.trim()}"'
                              : 'Chưa có gợi ý. Hãy nhập để tìm tên.',
                        ),
                      )
                    : NotificationListener<ScrollNotification>(
                        onNotification: (n) {
                          if (!_searching &&
                              n.metrics.pixels >=
                                  n.metrics.maxScrollExtent - 120) {
                            _loadMoreSuggestions();
                          }
                          return false;
                        },
                        child: ListView.separated(
                          itemCount: _items.length + (_loadingMore ? 1 : 0),
                          separatorBuilder: (_, __) => const Divider(height: 1),
                          itemBuilder: (_, i) {
                            if (_loadingMore && i == _items.length) {
                              return const Padding(
                                padding: EdgeInsets.all(12),
                                child:
                                    Center(child: CircularProgressIndicator()),
                              );
                            }
                            final u = _items[i];
                            final existed = widget.existingUids
                                .contains(u.uid); // double-check
                            return ListTile(
                              leading: CircleAvatar(
                                backgroundImage: u.avatar.isNotEmpty
                                    ? NetworkImage(u.avatar)
                                    : null,
                                child: u.avatar.isEmpty
                                    ? const Icon(Icons.person)
                                    : null,
                              ),
                              title: Text(u.name.isNotEmpty ? u.name : u.uid,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600)),
                              subtitle: Text(u.uid,
                                  style: const TextStyle(color: Colors.grey)),
                              onTap: existed ? null : () => _add(u.uid),
                              trailing: TextButton(
                                onPressed: existed ? null : () => _add(u.uid),
                                child: Text(existed ? 'Đã trong nhóm' : 'Add'),
                              ),
                            );
                          },
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
