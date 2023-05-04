module RecordsHelper
  def file_icon(type)
    case type
    when 'application/zip'
      'bi bi-file-earmark-zip'
    when 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      'bi bi-file-earmark-excel'
    when 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'
      'bi bi-file-earmark-word'
    end
  end
end
