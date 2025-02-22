package kr.or.ddit.board.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.board.board.vo.CommentVO;

@Mapper
public interface ICommentMapper {

	//댓글등록
	public int commentInsert(CommentVO cmtVO);

	public List<CommentVO> commentList(String boardNo);

	//대댓글 등록
	public int replyCommentInsert(CommentVO cmtVO);

	public int commentDelete(String commentNo);

	public CommentVO commentSelect(String commentNo);

	
}
