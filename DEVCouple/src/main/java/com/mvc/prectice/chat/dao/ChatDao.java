package com.mvc.prectice.chat.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.mvc.prectice.chat.dto.ChatDto;

@Repository
public interface ChatDao {

	String NAMESPACE = "chatquery.";
	public List<ChatDto>selectChatList();
	
	//방추가
	public int insertRoom(ChatDto chatdto);
	//방장 정보 insert전 select
	public ChatDto selectRoomNo(ChatDto chatdto);
	//방장 정보 insert
	public int insertMasterInfo(String id,int roomno);
	//방 Detail검색
	public ChatDto selectRoomDetail(int roomno);
	
	//기존 유저 검색
	public int selectExistUser(ChatDto chatdto);
		
	//유저 추가
	public int InsertUserInfo(ChatDto chatdto);
	
	//유저상태 변경
	public int updateUserInfo(ChatDto chatdto);
	
	//접속중인 유저리스트 출력
	public List<ChatDto> selectConnectUser(int roomno);
	
	//유저 검색
	public List<ChatDto> SearchUser(String searchVal,String roomno);
	
	//방나가기
	public int exitRoom(ChatDto chatdto);
	
	//대화추가
	public int insertChat(ChatDto chatdto);
	
	//방 삭제(방장권한)
	public int deleteRoom(int roomno);
	
	//유저 프로필 조회
	public ChatDto selectUserProfile(ChatDto dto);
	
	//채팅방 웹소켓에서 이미지만 추출
	public ChatDto selectOnlyUserImg(String username);
	 //마지막 메세지 번호 출력
	   public int selectLastMsgno(int roomno);
	 //스크롤 페이징 최근 12개씩 출력
	  public List<ChatDto>selectRecentMsg(int rownum,int roomno);
	//웹소켓 메세지 받을 시 상대방의 이미지 출력
	   public String selectYourImg(String id);
}
