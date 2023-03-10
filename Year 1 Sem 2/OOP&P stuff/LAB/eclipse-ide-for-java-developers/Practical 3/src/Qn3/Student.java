package Qn3;

public class Student {
	private String name;
	private int totalScore;
	private int numQuiz;
	
	public Student(String name)
	{
		this.name=name;
		this.numQuiz=0;
	}
	
	public void addQuiz(int score)
	{
		++numQuiz;
		this.totalScore += score;
	}
	
	public void getTotalScore()
	{
		System.out.println(name+"'s total score is "+totalScore);
	}
	
	public void getAverageScore()
	{
		double avgScore = totalScore/numQuiz;
		System.out.println(name+"'s average score is "+avgScore);
	}
}
