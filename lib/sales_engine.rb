require_relative './merchant_repository'
require_relative './item_repository'
require_relative './invoice_repository'
require_relative './invoice_item_repository'
require_relative './customer_repository'
require_relative './sales_analyst'
require_relative './transaction_repository'

class SalesEngine
  attr_reader :items,
              :merchants,
              :invoices,
              :invoice_items,
              :transactions,
              :customers

  def initialize(file_path_hash)
    @merchants = MerchantRepository.new(file_path_hash[:merchants])
    @items = ItemRepository.new(file_path_hash[:items])
    @invoices = InvoiceRepository.new(file_path_hash[:invoices])
    @invoice_items = InvoiceItemRepository.new(file_path_hash[:invoice_items])
    @transactions = TransactionRepository.new(file_path_hash[:transactions])
    @customers = CustomerRepository.new(file_path_hash[:customers])
  end

  def self.from_csv(file_path_hash)
    SalesEngine.new(file_path_hash)
  end

  def analyst
    sales_analyst = SalesAnalyst.new(@merchants, @items, @invoices,
                                      @invoice_items, @transactions)
  end

end
