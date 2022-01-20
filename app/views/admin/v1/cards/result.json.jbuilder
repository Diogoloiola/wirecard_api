json.message @card.nil? ? 'Cartão inválido' : 'Cartão válido'

json.issuer @card.issuing_bank_part.issuing_bank.name unless @card.nil?
