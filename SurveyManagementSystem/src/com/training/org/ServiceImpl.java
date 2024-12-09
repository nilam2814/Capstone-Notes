package com.training.org;

import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

public class ServiceImpl implements IFeedbackService {
	 private Map<Long, Feedback> feedbackMap = new HashMap<>();

	@Override
	public Feedback add(String description, String authorName) {
		 long nextId = feedbackMap.keySet().stream().max(Long::compareTo).orElse(0L) + 1;
	        Feedback newFeedback = new Feedback(nextId, description, authorName);
	        feedbackMap.put(nextId, newFeedback);
	        return newFeedback;
	}

	@Override
	public Feedback findById(long id) {
		return feedbackMap.get(id);
	}

	@Override
	public List<Feedback> findFeedbacksByAuthorOrderById(String author) {
		 return feedbackMap.values()
	                .stream()
	                .filter(feedback -> feedback.getDescription().startsWith(author))
	                .sorted(Comparator.comparing(Feedback::getId))
	                .collect(Collectors.toList());
	}

	
}
