require 'spec_helper'

describe 'ReportGenerator' do
  describe 'add_key_to_report' do
    it 'should generate a report with one key' do
      report = ReportGenerator.new
      report.add_key_to_report(:hola, 'chau')
      expect(report.report).to eq({ hola: 'chau' })
    end

    it 'should generate a report with two keys' do
      report = ReportGenerator.new
      report.add_key_to_report(:hola, 'chau')
      report.add_key_to_report(:numero, 5)
      expect(report.report).to eq({ hola: 'chau', numero: 5 })
    end
  end
end
