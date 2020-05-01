package com.portfoli.dao;

import java.util.List;
import com.portfoli.domain.BoardAttachment;

public interface BoardAttachmentDao {

  int insert(BoardAttachment boardAttachment) throws Exception;

  List<BoardAttachment> findAll() throws Exception;

  List<BoardAttachment> findByNo(int boardNumber) throws Exception;

  int delete(int boardNumber) throws Exception;

  int update(BoardAttachment boardAttachment) throws Exception;

}