package com.training.org;

import java.util.List;

public interface IFeedbackService {

	Feedback add(String description, String authorName);

	Feedback  findById(long id);

	List<Feedback> findFeedbacksByAuthorOrderById(String author);
}
