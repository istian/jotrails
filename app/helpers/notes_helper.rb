module NotesHelper
  def note_helper_path(note_type = "Text", note = nil, action = nil)
    send "#{format_sti(action, note_type, note)}_path", note
  end

  def format_sti(action, note_type, note)
    action || note ? "#{format_action(action)}#{note_type.underscore}" : "#{note_type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ""
  end
end
