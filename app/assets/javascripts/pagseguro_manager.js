$(document).ready(function() {
  // Inicia o PagSeguro
  PagSeguroDirectPayment.setSessionId($("#session_id").val());

  // Verifica se existe um cartão preenchido
  card_flag();

  // Pega o Sender Hash e o Card Token quando o usuário confirma os dados do cartão
  $("#buy-button").click(function() {
    console.log("Buy Button Event Click Handling");
    $('#sender_hash').val(PagSeguroDirectPayment.getSenderHash());

    var params = {
     cardNumber: $("#card-number").val(),
     cvv: $("#card-cvv").val(),
     expirationMonth: $("#card-month").val(),
     expirationYear: $("#card-year").val(),
     success: function (response) {
       //token gerado, esse deve ser usado na chamada da API do Checkout Transparente
       $('#card_token').val(response['card']['token']);
       $('#payment-datas').find("input").prop("readonly", true);
       $("#payment-datas option:not(:selected)").prop("disabled", true);
       $("#payment-datas #buy-button[type='button']").hide();
       $('#finish-buy').fadeIn();
     },
     error: function (response) {
       console.log(response);
       alert('As informações sobre o cartão estão incorretas')
     }
    }

    PagSeguroDirectPayment.createCardToken(params);
  });

  // Muda do step de finalização para o step de edição do meio de pagamento
  $("#edit-payment").click(function() {
    $('#finish-buy').hide();
    $('#payment-datas').find("input").prop("readonly", false);
    $("#payment-datas option:not(:selected)").prop("disabled", false);
    $("#payment-datas #buy-button[type='button']").show();
  });

  // Verifica informações sobre o cartão digitado como a bandeira
  //, tamanho do cvv, se possui expiração de é internacional e etc
  $("#card-number").on('input', function() {
    card_flag();
  });

  // Atualiza o field escondido com o valor a ser parcelado
  $("#card-options").change(function(){
    $(".installment_value_field").val($(this).find(":selected").data('installmentAmount'));
  });
})


function card_flag()
{
  PagSeguroDirectPayment.getBrand({
   cardBin: $("#card-number").val(),
   success: function (response) {
     console.log(response);
     //Coloca qual a bandeira ao lado do numero
     $(".card-flag").html(response['brand']['name']);
     $("span.card-flag").show();
     //Mostra as opções de parcelamento (passando o preço e a bandeira)
     showPaymentOptions(response['brand']['name'], $("#price").val());
     $("#card-options-box").show();
     //Mostra o campo CVV se o cartão exigir
     if(response['brand']['cvvSize'] > 0){$("#card-cvv-box").show();}
   },
   error: function (response) {
     console.log($("#card-number").val());
     console.log(response);
     $("span.card-flag").hide();
     $("#card-cvv-box").hide();
     $("#card-options-box").hide();
   }
  });
}

//Função para pegar o token do cartão de crédito que será usado no checkout
function getCardToken(card_number, cvv, month, year){
  console.log(month);
  console.log(year);
  var params = {
    cardNumber: card_number,
    cvv: cvv,
    expirationMonth: month,
    expirationYear: year,
    success: function (response) {
      console.log(response);
    },
    error: function (response) {
      console.log(response);
    }
  }

  PagSeguroDirectPayment.createCardToken(params);
}

// Função para mostrar opções de pagamento para o usuário
function showPaymentOptions(flag, price)
{
  PagSeguroDirectPayment.getInstallments({
   amount: price,
   brand: flag,
   success: function (response) {
     $("#card-options").html("");
     $.each( response['installments'][flag], function( index, value ){
       $("#card-options")
       .append($("<option></option>")
                  .attr("value",value['quantity'])
                  .attr("data-installment-amount", value['installmentAmount'])
                  .text("$"+value['installmentAmount']+" x "+value['quantity']+" - total: $"+value['totalAmount']));
     });
   },
   error: function (response) {
     console.log(response);
   },
   complete: function (response) {
     //tratamento comum para todas chamadas
   }
 });
}
