package com.portfoli.service;

import java.util.List;
import com.portfoli.domain.BoardAttachment;

public interface BoardAttachmentService {

  boolean add(BoardAttachment boardAttachment) throws Exception;

  List<BoardAttachment> list() throws Exception;

  List<BoardAttachment> get(int boardNumber) throws Exception;

  boolean delete(int boardNumber) throws Exception;

  boolean update(BoardAttachment boardAttachment) throws Exception;

  
}