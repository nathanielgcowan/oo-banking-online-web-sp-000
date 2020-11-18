class Transfer
  # your code here
  attr_reader :amount, :sender, :receiver
  attr_accessor :status

  def initalize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balnce -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      reject_transfer
    end
  end

end
