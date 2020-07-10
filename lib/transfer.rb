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
    if  valid? && sender.balance > amount && self.status = "pending"
      @sender.deposit( @amount * -1 ) 
      @receiver.deposit( @amount )
      @status = "complete"
    elsif self.status == "complete"
      puts ""
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end
  
  
  
  
end
