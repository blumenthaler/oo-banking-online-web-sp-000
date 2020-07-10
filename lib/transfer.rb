class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end
  
  def valid?
    if sender.valid? == true && receiver.valid? == true
      true
    else
      false
    end
  end
  
  def execute_transaction
    if self.status == "complete"
      puts "Transaction was already excuted."
    elsif  valid? && sender.balance > amount && self.status = "pending"
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status = "complete"
      @receiver.deposit( @amount * -1 ) 
      @sender.deposit( @amount )
      @status = "reversed"
    end
  end
  
  
  
  
end
