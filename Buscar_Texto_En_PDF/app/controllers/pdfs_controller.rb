class PdfsController < ApplicationController
  # GET /pdfs
  # GET /pdfs.json
  def index
    @pdfs = Pdf.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pdfs }
    end
  end

  # GET /pdfs/1
  # GET /pdfs/1.json
  def show
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pdf }
    end
  end

  # GET /pdfs/new
  # GET /pdfs/new.json
  def new
    @pdf = Pdf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pdf }
    end
  end

  # GET /pdfs/1/edit
  def edit
    @pdf = Pdf.find(params[:id])
  end

  # POST /pdfs
  # POST /pdfs.json
  def create
    @pdf = Pdf.new(params[:pdf])

    respond_to do |format|
      if @pdf.save
        format.html { redirect_to @pdf, notice: 'Pdf was successfully created.' }
        format.json { render json: @pdf, status: :created, location: @pdf }
      else
        format.html { render action: "new" }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pdfs/1
  # PUT /pdfs/1.json
  def update
    @pdf = Pdf.find(params[:id])

    respond_to do |format|
      if @pdf.update_attributes(params[:pdf])
        format.html { redirect_to @pdf, notice: 'Pdf was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @pdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pdfs/1
  # DELETE /pdfs/1.json
  def destroy
    @pdf = Pdf.find(params[:id])
    @pdf.destroy

    respond_to do |format|
      format.html { redirect_to pdfs_url }
      format.json { head :ok }
    end
  end
end
