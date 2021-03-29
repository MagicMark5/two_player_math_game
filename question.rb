class Question 

  def generate_question
    a = self.random_num
    b = self.random_num
    p "What does #{a} plus #{b} equal?"
    return a + b
  end

  def random_num
    rand(1..20)
  end

end