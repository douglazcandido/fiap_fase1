while True:

    satisfacao = int(input('De 0 à 100, qual sua satisfação com o atendimento (Sendo 0 ruim e 100 excelente)? '))

    if 0 <= satisfacao <= 100:
        if satisfacao >= 90:
            print('Qualidade')
        elif 70 <= satisfacao <= 89:
            print('Neutro')
        else:
            print('Insatisfatório')
        break
        
    else:
        print('Nota fora do intervalo')
