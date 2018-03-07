class CatsRentalRequest < ApplicationRecord
  validates :cat_id, :start_date, :end_date, :status, presence: true
  validates :status, inclusion: { in: %w(PENDING APPROVED DENIED), message: "%{value} not a valid status"}

  belongs_to :cat,
    foreign_key: :cat_id,
    class_name: :Cat

  def overlapping_requests
    self.cat.rental_requests
      .where( 'start_date between ? and ? And end_date between ? and ?', self.start_date, self.end_date, self.start_date, self.end_date )
  end

end

rental1 = CatsRentalRequest.new(cat_id: 4, start_date: '01/03/2018', end_date: '03/03/2018')
rental2 = CatsRentalRequest.new(cat_id: 4, start_date: '11/04/2018', end_date: '30/04/2018')
rental3 = CatsRentalRequest.new(cat_id: 4, start_date: '06/03/2018', end_date: '13/03/2018')
rental4 = CatsRentalRequest.new(cat_id: 4, start_date: '01/06/2018', end_date: '03/06/2018')
rental5 = CatsRentalRequest.new(cat_id: 4, start_date: '20/02/2018', end_date: '02/03/2018')
rental5 = CatsRentalRequest.new(cat_id: 4, start_date: '02/03/2018', end_date: '06/03/2018')
ental5 = CatsRentalRequest.new(cat_id: 4, start_date: '29/02/2018', end_date: '06/03/2018')
