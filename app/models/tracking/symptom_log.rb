module Tracking
  class SymptomLog
    include ActiveModel::Model

    attr_accessor :symptom_id, :symptom_severity, :symptom_timing

    validates :symptom_id, :symptom_severity, :symptom_timing, presence: true
  end
end
