import psycopg2

# Connect to an existing database
connection = psycopg2.connect(
    database="proj_bd",
    host="localhost",
    port="5432",
    user="postgres",
    password="postgres",
)

# Open a cursor to perform database operations
cursor = connection.cursor()

while True:
    op = int(input("""
      Você é um agente de viagens, aqui estão algumas opções de reserva para você!
      
      Digite o número referente ao que deseja realizar:
      1 - Cadastrar uma reserva;
      2 - Consultar quantas reservas possuem status 'Cancelado' entre o ano X até Y;
      3 - Sair;
  """))

    if op == 1:
        viagem = input('Digite o número da viagem (existem viagens de 1 a 8 cadastradas): ')

        titular = input('Digite o CPF do seu cliente: ')

        agente_viagem = input('Digite seu CPF: ')

        preco_total = input('Digite o preço total da reserva: ')

        status = input("Digite Confirmada ou Cancelada para a pergunta: Qual o status da reserva? ")

        online = input("Digite S ou N para a pergunta: A compra foi online? ")

        avaliacao = input('Digite um número de 1 a 10 avaliando a reserva: ')

        estadia = input('Digite o CNPJ do lugar de estádia (existem alguns CNPJs já cadastrados): ')

        passeio = input('Digite o ID do passeio (existem passeios de 1 a 6 cadastrados): ')

        print(online)

        cursor.execute(
            "INSERT INTO reserva(viagem, titular, agente_viagem, preco_total, status, online, avaliacao, estadia, "
            "passeio) VALUES(%s, %s, %s, %s, %s, %s, %s, %s, %s);",
            (viagem, titular, agente_viagem, preco_total, status, online, avaliacao, estadia, passeio))

        connection.commit()

    elif op == 2:
        ano_um = input("De: ")
        ano_dois = input("Até: ")

        cursor.execute("""
            SELECT COUNT(*) AS Qtd_Reservas_Canceladas
            FROM reserva r
            JOIN viagem v ON r.viagem = v.id
            WHERE r.status = 'Cancelado'
            AND EXTRACT(YEAR FROM v.data_hora) BETWEEN %s AND %s;
        """, (ano_um, ano_dois))

        rows = cursor.fetchall()
        for row in rows:
            print(row)

    elif op == 3:
        print("Finalizado com sucesso!")
        break

# Close communication with the database
cursor.close()
connection.close()
