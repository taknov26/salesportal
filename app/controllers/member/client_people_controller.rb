class Member::ClientPeopleController < ApplicationController

  def create
    @client = Client.find(params[:client_id])
    @client_person = @client.client_people.build(client_person_params)
    if @client_person.save
      redirect_to member_client_path(@client), notice: "登録完了。"
    else
      render "clients/show", alert: "登録できませんでした。"
    end
  end

  def update
    @client_person = ClientPerson.find(params[:id])
    if @client_person.update(client_person_params)
      redirect_to member_client_path(@client_person.client), notice: "更新しました。"
    else
      render"clients/show", alert: "更新に失敗しました"
    end
  end

  private

  def client_person_params
    params.require(:client_person).permit(:name, :department, :telephone_number, :email, :status)
  end

end
