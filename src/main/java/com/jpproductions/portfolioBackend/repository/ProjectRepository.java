package com.jpproductions.portfolioBackend.repository;

import com.jpproductions.portfolioBackend.model.Project;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProjectRepository extends JpaRepository<Project, Long> {
}