package com.project.myapp.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.project.myapp.board.dao.IBoardCategoryRepository;
import com.project.myapp.board.model.BoardCategory;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BoardCategoryService implements IBoardCategoryService {
	
	private final IBoardCategoryRepository IBoardCategory;
	@Override
	public List<BoardCategory> selectAllCategory() {
		return IBoardCategory.selectAllCategory();
	}

	@Override
	public void insertNewCategory(BoardCategory boardCategory) {
		int newCategoryId = IBoardCategory.selectMaxCategoryId()+1;
		boardCategory.setCategoryId(newCategoryId);
		IBoardCategory.insertNewCategory(boardCategory);
		
	}

	@Override
	public void updateCategory(BoardCategory boardCategory) {
		IBoardCategory.updateCategory(boardCategory);
		
	}

	@Override
	public void deleteCategory(int categoryId) {
		IBoardCategory.deleteCategory(categoryId);
		
	}

}
