samoglasnici = ["a", "e", "i", "o", "u"]
ime = input(str("Upište svoje ime."))

samoglasnici_u_imenu = [elem for elem in ime if elem in samoglasnici]
broj_samoglasnika_u_imenu = len(samoglasnici_u_imenu)

print(f"U vašem imenu ima {broj_samoglasnika_u_imenu} samoglasnika, a to su: {samoglasnici_u_imenu}")
