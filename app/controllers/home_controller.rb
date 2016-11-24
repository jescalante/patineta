class HomeController < ApplicationController
  def index
  end

  def contact
    contact = contact_params

    Pony.mail(
      to: 'josecito_7@hotmail.com',
      from: 'contacto@patinetacolors.com',
      subject: "Nueva consulta de #{contact[:name]}",
      reply_to: contact[:email]
      body: "Teléfono: #{contact[:phone]}\n\nMensaje: #{contact[:message]}"
    )

    respond_to do |format|
      format.html {}
      format.json {
        render json: "Success!"
      }
    end
  end

  private
  # Only allow a trusted parameter "white list" through.
  def contact_params
    params.require(:reservation).permit(%i{ name email phone message })
  end
end
