package kr.kh.app.service;

public class AdminServiceImp implements AdminService {

	@Override
	public boolean updateUser(String me_id, String me_name, String me_pw, String me_email) {
	    // 유저 정보가 충분한 경우에만 처리
	    if (me_id == null || me_name == null || me_email == null) {
	        return false;  // 필수 정보가 없으면 실패로 간주
	    }
	    
	    // 비밀번호가 null이 아닌 경우, 암호화 처리 필요 (생략됨)
	    // 비밀번호가 없으면 기존 비밀번호를 유지한다고 가정

	    MemberVO member = new MemberVO(me_id, me_name, me_pw, me_email);

	    try {
	        // DAO 호출하여 유저 정보 업데이트
	        return MemberDAO.updateMember(member) > 0;
	    } catch (Exception e) {
	        // 예외 발생 시 로그 출력 및 실패 반환
	        e.printStackTrace();
	        return false;
	    }
	}
}
