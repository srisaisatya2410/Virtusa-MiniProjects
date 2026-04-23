class Questions{
    String question;
    String[] options;
    int correctAnswer;

    public Questions(String question, String[] options, int correctAnswer){
        this.question=question;
        this.options=options;
        this.correctAnswer=correctAnswer;
    }
    public void ShowQuestions(){
        System.out.println("\n"+question);
        for(int i=0;i<options.length;i++){
            System.out.println((i+1)+". "+options[i]);
        }
    }
    public boolean isCorrect(int ans){
        return ans==correctAnswer;
    }
}