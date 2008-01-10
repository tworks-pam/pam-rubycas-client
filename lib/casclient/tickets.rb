module CASClient
  # Represents a CAS service ticket.
  class ServiceTicket
    attr_reader :ticket, :service, :renew
    attr_accessor :response
    
    def initialize(ticket, service, renew = false)
      @ticket = ticket
      @service = service
      @renew = renew
    end
    
    def is_valid?
      response.is_success?
    end
    
    def has_been_validated?
      not response.nil?
    end
  end
  
  # Represents a CAS proxy ticket.
  class ProxyTicket < ServiceTicket
    attr_reader :pgt_url
    
    def initialize(ticket, service, pgt_url, renew = false)
      @ticket = ticket
      @service = service
      @pgt_url = pgt_url
      @renew = renew
    end
  end
  
  class ProxyGrantingTicket
    attr_reader :ticket, :iou
    
    def initialize(ticket, iou)
      @ticket = ticket
      @iou = iou
    end
    
    def to_s
      ticket
    end
  end
end