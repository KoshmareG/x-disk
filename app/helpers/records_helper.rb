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

  def available_disk_space(space_used)
    ((Record::DISK_SPACE_LIMIT - space_used.to_f) / 1_000_000).round(2)
  end
end
