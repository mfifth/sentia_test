class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    CsvRecord.destroy_all
  end

  def process_records
    file = params[:csv_file].path

    CSV.foreach(file, headers: true, header_converters: lambda {|header| header.downcase.gsub(" ", "_")}) do |row|
      data = row.to_hash
      CsvRecord.create(name: data['name'], record_date: data['date'], record_id: data['number'], description: data['description'])
    end

    redirect_to '/results'
  end

  def results
    @csv_records = CsvRecord.order("#{sort_column} #{sort_direction}")
  end

  def search
    query = params[:query]
    puts query
  end

  private

  def sortable_columns
    ["name", "record_id", "record_date"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
