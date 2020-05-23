package com.mvc.prectice.chat.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mvc.prectice.chat.dto.ChatDto;

@Repository
public class ChatDaoImpl implements ChatDao{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<ChatDto> selectChatList() {
		List<ChatDto>list = new ArrayList<ChatDto>();
		
		try {
			list = sqlSession.selectList(NAMESPACE + "selectChatList");
		} catch (Exception e) {
			System.out.println("[error]:selectChatList");
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public int insertRoom(ChatDto chatdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertRoom",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:insertRoom");
			e.printStackTrace();
		}
		
		return res;
	}
	
	@Override
	public ChatDto selectRoomNo(ChatDto chatdto) {
		ChatDto dto = new ChatDto();
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectRoomNo",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:selectRoomNo");
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int insertMasterInfo(String id,int roomno) {
		int res = 0;
		Map<String,String>hashmap = new HashMap<String,String>();
		try {
			hashmap.put("id", id);
			hashmap.put("roomno", Integer.toString(roomno));
			res = sqlSession.insert(NAMESPACE + "insertMasterInfo",hashmap);
		} catch (Exception e) {
			System.out.println("[error]:insertMasterInfo");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public ChatDto selectRoomDetail(int roomno) {
		ChatDto dto = new ChatDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectRoomDetail",roomno);
		} catch (Exception e) {
			System.out.println("[error]:selectRoomDetail");
			e.printStackTrace();
		}
		return dto;
	}
	
	@Override
	public int selectExistUser(ChatDto chatdto) {
		int cnt = 0;
		
		try {
			cnt = sqlSession.selectOne(NAMESPACE + "selectExistUser",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:selectExistUser");
			e.printStackTrace();
		}
		return cnt;
	}

	@Override
	public int InsertUserInfo(ChatDto chatdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "InsertUserInfo",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:InsertUserInfo");
			e.printStackTrace();
		}
		return res;
	}
	
	@Override
	public int updateUserInfo(ChatDto chatdto) {
		int res = 0;
		try {
			res = sqlSession.update(NAMESPACE + "updateUserInfo",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:updateUserInfo");
			e.printStackTrace();
		}
		return res;
	}

	@Override
	public List<ChatDto> selectConnectUser(int roomno) {
		List<ChatDto>list = new ArrayList<ChatDto>();
		try {
			list = sqlSession.selectList(NAMESPACE + "selectConnectUser",roomno);
		
		} catch (Exception e) {
			System.out.println("[error]:selectConnectUser");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<ChatDto> SearchUser(String searchVal, String roomno) {
		List<ChatDto>list = new ArrayList<ChatDto>();
		Map<String,String>hashmap = new HashMap<String,String>();
		System.out.println(searchVal + "::"+ roomno+"::다오임플");
		try {
			hashmap.put("searchval", searchVal);
			hashmap.put("roomno", roomno);
			
			list = sqlSession.selectList(NAMESPACE + "SearchUser",hashmap);
		} catch (Exception e) {
			System.out.println("[error]:SearchUser");
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public int exitRoom(ChatDto chatdto) {
		int res = 0;
		
		try {
			res = sqlSession.update(NAMESPACE + "exitRoom",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:exitRoom");
			e.printStackTrace();
		}
		
		return res;
	}

	@Override
	public int insertChat(ChatDto chatdto) {
		int res = 0;
		
		try {
			res = sqlSession.insert(NAMESPACE + "insertChat",chatdto);
		} catch (Exception e) {
			System.out.println("[error]:insertChat");
			e.printStackTrace();
		}
		
		return res;
	}
	
   @Override
   public int deleteRoom(int roomno) {
      int res = 0;
      
      try {
         res = sqlSession.delete(NAMESPACE + "deleteRoom",roomno);
      } catch (Exception e) {
         System.out.println("[error]:deleteRoom");
         e.printStackTrace();
      }
      return res;
   }

	@Override
	public ChatDto selectUserProfile(ChatDto dto) {
		ChatDto chatdto = new ChatDto();
		
		try {
			chatdto = sqlSession.selectOne(NAMESPACE + "selectUserProfile",dto);
		} catch (Exception e) {
			System.out.println("[error]:selectUserProfile");
			e.printStackTrace();
		}
		return chatdto;
	}

	@Override
	public ChatDto selectOnlyUserImg(String username) {
		ChatDto dto = new ChatDto();
		
		try {
			dto = sqlSession.selectOne(NAMESPACE + "selectOnlyUserImg",username);
		} catch (Exception e) {
			System.out.println("[error]:selectOnlyUserImg");
			e.printStackTrace();
		}
		return dto;
	}

	@Override
	public int selectLastMsgno(int roomno) {
		int res = 0;
		try {
			res = sqlSession.selectOne(NAMESPACE + "selectLastMsgno",roomno);
		} catch (Exception e) {
			System.out.println("[error]:selectLastMsgno");
			e.printStackTrace();
		}
		return res;
	}

	
	@Override
	public List<ChatDto> selectRecentMsg(int rownum,int roomno) {
		List<ChatDto>list = new ArrayList<ChatDto>();
		Map<String,Integer>hashmap = new HashMap<String,Integer>();
		
		try {
			hashmap.put("rownum",rownum);
			hashmap.put("roomno",roomno);
			list = sqlSession.selectList(NAMESPACE + "selectRecentMsg",hashmap);
		} catch (Exception e) {
			System.out.println("[error]:selectRecentMsg");
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public String selectYourImg(String id) {
		String profileimg = "";
		
		try {
			profileimg = sqlSession.selectOne(NAMESPACE + "selectYourImg",id);
		} catch (Exception e) {
			System.out.println("[error]:selectYourImg");
			e.printStackTrace();
		}
		return profileimg;
	}


}
