class NotesController < ApplicationController

  before_filter :set_note, :only => [:show, :update, :edit, :destroy]
  before_filter :set_note_type

  def index
    @notes = note_type_class.all
  end

  def show
  end

  def destroy
    @note.destroy
    redirect_to note_type.underscore.pluralize.to_sym, :notice => "Record successfully deleted."
  end

  def edit
  end

  def update
    if @note.update_attributes(note_params)
      redirect_to @note, :notice => "#{note_type} was successfully updated!"
    else
      flash.now.alert = "Note not saved. Please try again."
      render "edit"
    end
  end

  def new
    @note = note_type_class.new
  end

  def create
    @note = note_type_class.new(note_params)
    if @note.save
      redirect_to(@note, :notice => "New note created!")
    else
      flash.now.alert = "Note not saved. Please try again."
      render "new"
    end
  end

  private
  def note_types
    ["Html", "Markdown", "Text"]
    # %w(Html, Markdown, Text)
  end

  def note_type
    note_types.include?(params[:type]) ? params[:type] : "Text"
  end

  def note_type_class
    # params[:type].constantize if params[:type].in? note_types
    note_type.constantize
  end

  def set_note_type
    @note_type = note_type
  end

  def set_note
    @note = note_type_class.find(params[:id])
  end

  def note_params
    params[note_type.underscore.to_sym][:users_id] = session[:authenticated]
    params[note_type.underscore.to_sym]
  end

end
