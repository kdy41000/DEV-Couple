package com.mvc.prectice.chat.biz;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.mvc.prectice.chat.dao.ChatDao;
import com.mvc.prectice.chat.dto.ChatDto;

@Service
public class ChatBizImpl implements ChatBiz{

	@Autowired
	private ChatDao dao;
	
	@Override
	public List<ChatDto> selectChatList() {
		// TODO Auto-generated method stub
		return dao.selectChatList();
	}

	@Override
	public int insertRoom(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.insertRoom(chatdto);
	}
	
	@Override
	public ChatDto selectRoomNo(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.selectRoomNo(chatdto);
	}


	@Override
	public int insertMasterInfo(String id,int roomno) {
		// TODO Auto-generated method stub
		return dao.insertMasterInfo(id, roomno);
	}
	
	@Override
	public ChatDto selectRoomDetail(int roomno) {
		// TODO Auto-generated method stub
		return dao.selectRoomDetail(roomno);
	}
	
	@Override
	public int selectExistUser(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.selectExistUser(chatdto);
	}
	
	@Override
	public int InsertUserInfo(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.InsertUserInfo(chatdto);
	}

	@Override
	public int updateUserInfo(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.updateUserInfo(chatdto);
	}
	
	@Override
	public List<ChatDto> selectConnectUser(int roomno) {
		// TODO Auto-generated method stub
		return dao.selectConnectUser(roomno);
	}

	@Override
	public List<ChatDto> SearchUser(String searchVal, String roomno) {
		// TODO Auto-generated method stub
		return dao.SearchUser(searchVal, roomno);
	}

	@Override
	public int exitRoom(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.exitRoom(chatdto);
	}

	@Override
	public int insertChat(ChatDto chatdto) {
		// TODO Auto-generated method stub
		return dao.insertChat(chatdto);
	}

   @Override
   public int deleteRoom(int roomno) {
      // TODO Auto-generated method stub
      return dao.deleteRoom(roomno);
   }

	@Override
	public ChatDto selectUserProfile(ChatDto dto) {
		// TODO Auto-generated method stub
		return dao.selectUserProfile(dto);
	}

	@Override
	public ChatDto selectOnlyUserImg(String username) {
		// TODO Auto-generated method stub
		return dao.selectOnlyUserImg(username);
	}

	@Override
	public int selectLastMsgno(int roomno) {
		// TODO Auto-generated method stub
		return dao.selectLastMsgno(roomno);
	}
	
	@Override
	public List<ChatDto> selectRecentMsg(int rownum, int roomno) {
		// TODO Auto-generated method stub
		return dao.selectRecentMsg(rownum,roomno);
	}
	@Override
	public String selectYourImg(String id) {
		// TODO Auto-generated method stub
		return dao.selectYourImg(id);
	}

}
