class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
    @users = User.all
    
    @uid = user_signed_in?? current_user.id : 0 #get initial id
    
    @filter = params.has_key?(:filter)? params[:filter] : "all"                             #get filter
    @filter = user_signed_in?? @filter : ["all", "open"].include?(@filter)? @filter : "all" #if user is not logged only two filters are available
    @sortby = params.has_key?(:sort)? params[:sort] : "id"                                  #get sort by type
    @order = params.has_key?(:order)? params[:order] : "DESC"                               #get order
    @value = params.has_key?(:value)? params[:value] : "id"                                 #get value type for sorting

    # Filtering by type -> value
    case @filter
    when "all"
      @sorted = @issues
    when "open"
      @sorted = @issues.select{ |issue| issue.status.downcase == "new" || issue.status.downcase == "open" || issue.status.downcase == "on hold"}
    when "watching"
      @watching = Watching.select{ |watch| watch.user == @uid }
      @sorted = @watching.size > 0? @issues.select{ |issue| @watching.exists?{ |watch| watch.issue == issue.id }} : []
    when "mine"
      @sorted = @issues.select{ |issue| issue.userCreator == @uid}
    when "type"
      @sorted = @issues.select{ |issue| issue.issueType.downcase == @value }
    when "prior"
      @sorted = @issues.select{ |issue| issue.priority.downcase == @value }
    when "stat"
      @sorted = @issues.select{ |issue| issue.status.downcase == @value }
    when "assig"
      @sorted = @issues.select{ |issue| issue.idUserAssignee == @value }
    when "title"
      @sorted = @issues.select{ |issue| issue.title == @value }
    end
    
    # Sorting by type or default = issue_id
    case @sortby
    when "type"
      @sorted = @sorted.sort_by{|issue| issue.issueType }
    when "prior"
      @sorted = @sorted.sort_by{|issue| issue.priority }
    when "stat"
      @sorted = @sorted.sort_by{|issue| issue.status }
    when "votes"
      @sorted = @sorted.sort_by{|issue| issue.votes }
    when "assig"
      @sorted = @sorted.sort_by{|issue| [issue.idUserAssignee ? 1 : 0, issue.idUserAssignee] }
    when "creation"
      @sorted = @sorted.sort_by{|issue| issue.creationDate}
    when "update"
      @sorted = @sorted.sort_by{|issue| issue.updated}
    when "title"
      @sorted = @sorted.sort_by{|issue| issue.title }
    else
      @sorted = @sorted.sort_by{|issue| issue.id }
    end
    
    # order by
    @sorted =  @order == "ASC"? @sorted : @sorted.reverse
    
    # page controller
    @npages = @sorted? (@sorted.size > 0? (@sorted.size/25.0).ceil : 1) : 1
    @page = params.has_key?(:page)? params[:page].to_i > @npages? @npages : params[:page].to_i%(@npages+1) : 1
    @last_index = @sorted? [@sorted.size, @page*25].min : 0
    @first_index = @last_index == 0? 0 : (25 * (@page-1))+1
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @user_creator = User.find(@issue.userCreator)
    @user = User.find(current_user.id);
    @comments = Comment.all
    
    @comments = @comments.select{|comment| comment.issue_id == @issue.id}
    @comment = Comment.new
    @comment.issue_id = @issue.id
    @comment.user_id = @user.id
    
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    @issue = Issue.new(issue_params)
    @issue.userCreator  = current_user.id
    @issue.idUserAssignee = current_user.id
    @issue.votes = 0
    @issue.creationDate = Time.now
    @issue.updated = Time.now
    @issue.status = 'NEW'
    respond_to do |format|
      if @issue.save
        format.html { redirect_to @issue, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    respond_to do |format|
      @issue.votes = 0
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
       params.require(:issue).permit(:userCreator, :idUserAssignee, :title, :description, :issueType, :priority, :status, :votes, :file, :creationDate, :updated)
    end
end
