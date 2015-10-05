class Trooper

  def initialize(trooper)
    @rank = trooper['rank']
    @first_name = trooper['first_name']
    @last_name = trooper['last_name']
    @morale = trooper['morale']
    @upp = trooper['upp']
    @skills = trooper['skill_line']
    if trooper.has_key?('wound') 
      @wound = trooper['wound']
    else 
      @wound = ''
    end
  end 

  def trooper_text
    return "#{@rank} #{@first_name} #{@last_name} #{@skills} #{@morale}"
  end
  
  def trooper_morale?
    return @morale
  end

end

