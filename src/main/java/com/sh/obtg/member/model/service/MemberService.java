package com.sh.obtg.member.model.service;

import static com.sh.obtg.common.JdbcTemplate.close;
import static com.sh.obtg.common.JdbcTemplate.commit;
import static com.sh.obtg.common.JdbcTemplate.getConnection;
import static com.sh.obtg.common.JdbcTemplate.rollback;

import java.sql.Connection;
import java.util.List;
import java.util.Map;

import com.sh.obtg.member.model.dao.MemberDao;
import com.sh.obtg.member.model.dto.Like;
import com.sh.obtg.member.model.dto.Member;
import com.sh.obtg.member.model.dto.MyPost;
import com.sh.obtg.member.model.dto.MyPosts;

public class MemberService {
	
	private MemberDao memberDao = new MemberDao();
	
	public Member selectOneMember(String memberId) {
		Connection conn = getConnection();
		System.out.println(conn);
		Member member = memberDao.selectOneMember(conn, memberId);
		close(conn);
		return member;
	}
	public int updateMemberRole(String memberId, String memberRole) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updateMemberRole(conn, memberId, memberRole);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	
	public List<Member> searchMember(Map<String, String> param) {
		Connection conn = getConnection();
		List<Member> members = memberDao.searchMember(conn, param);
		close(conn);
		return members;
	}
	
	public List<Member> selectAllMember(Map<String, Object> param) {
		Connection conn = getConnection();
		List<Member> members = memberDao.selectAllMember(conn, param);
		close(conn);
		return members;
	}
	
	public int selectTotalCount() {
		Connection conn = getConnection();
		int totalCount = memberDao.selectTotalCount(conn);
		close(conn);
		return totalCount;
	}
	public int deleteMemberAD(String memberId) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.deleteMemberAD(conn, memberId);
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
		} finally {
			close(conn);
		}
		return result;
	}

	public int updatePassword(Member member) {
		Connection conn = getConnection();
		int result = 0;
		try {
			result = memberDao.updatePassword(conn, member);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}
	public int updateMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.updateMember(conn, member);
			commit(conn);
		} catch(Exception e) {
			rollback(conn);
			throw e;
		}finally {
			close(conn);
		}
		return result;
	}
	public int insertMember(Member member) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.insertMember(conn, member);
			commit(conn);
		}catch(Exception e) {
			rollback(conn);
		}finally {
			close(conn);
		}
		return result;
	}
	public int deleteMember(String memberId) {
		int result = 0;
		// 1. Connection?????? ??????
		Connection conn = getConnection();
		try {
			// 2. dao ??????
			result = memberDao.deleteMember(conn, memberId);
			// 3. ???????????? ??????
			commit(conn);
		} catch (Exception e) {
			rollback(conn);
			throw e; // controller ?????????
		} finally {
			// 4. Connection?????? ??????
			close(conn);
		}
		return result;
	}
	
	// ?????? ??? ?????? ???????????? ??????(ootd + share)
	public int getMyPostTotalCount(String memberId) {
		Connection conn = getConnection();
		int ootdCnt = memberDao.selectMyOotdPostCnt(conn, memberId);
		int shareCnt = memberDao.selectMySharePostCnt(conn, memberId);
		close(conn);
		return ootdCnt + shareCnt;
	}
	
	// ?????? ??? ootd??? ??????
	public List<MyPost> selectMyOotdPost(String memberId) {
		Connection conn = getConnection();
		List<MyPost> ootdBoardList = memberDao.selectMyOotdPost(conn, memberId);
		close(conn);
		return ootdBoardList;
	}
	
	// ?????? ??? share??? ??????
	public List<MyPosts> selectMySharePost(String memberId) {
		Connection conn = getConnection();
		List<MyPosts> shareBoardList = memberDao.selectMySharePost(conn, memberId);
		close(conn);
		return shareBoardList;
	}
	
	// ?????? ??? share??? ??? ??????
	public int getMySharePostCnt(String memberId) {
		Connection conn = getConnection();
		int shareCnt = memberDao.selectMySharePostCnt(conn, memberId);
		close(conn);
		return shareCnt;
	}
	
	// ?????? ??? ootd??? ??? ??????
	public int getMyOotdPostCnt(String memberId) {
		Connection conn = getConnection();
		int ootdCnt = memberDao.selectMyOotdPostCnt(conn, memberId);
		close(conn);
		return ootdCnt;
	}
	
	// ?????? ootd ????????? ??????
	public List<Like> selectOotdLike(String memberId) {
		Connection conn = getConnection();
		List<Like> ootdLikes = memberDao.selectOotdLike(conn, memberId);
		close(conn);
		return ootdLikes;
	}
	
	// ?????? share ????????? ??????
	public List<Like> selectShareLike(String memberId) {
		Connection conn = getConnection();
		List<Like> ootdLikes = memberDao.selectShareLike(conn, memberId);
		close(conn);
		return ootdLikes;
	}
	
	// ????????? ??????
	public int selectEmail(String memberEmailId) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.selectEmail(conn, memberEmailId);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
	public int selectBlackList(String memberEmailId) {
		int result = 0;
		Connection conn = getConnection();
		try {
			result = memberDao.selectBlackList(conn, memberEmailId);
		} catch (Exception e) {
			throw e;
		} finally {
			close(conn);
		}
		return result;
	}
}