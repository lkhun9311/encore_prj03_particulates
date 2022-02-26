package com.playdata.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.playdata.model.Board;

public interface BoardRepository extends JpaRepository<Board, Integer>{

}
