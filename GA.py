import random
import matplotlib.pyplot as plt

# Define the knapsack problem parameters
items = [(3, 10), (12, 5), (8, 15), (4, 7), (6, 6), (3, 1), (6, 10), (3, 11), (3, 2), (5, 8), (15, 20), (7, 14), (9, 6),
         (5, 9), (12, 36), (2, 1), (8, 14), (9, 10)]  # Format: (weight, value)
knapsack_capacity = 45

# Genetic algorithm parameters
population_size = 150
generations = 300
mutation_rate = 0.03


# Function to create initial population
def create_initial_population():
    population = []
    for _ in range(population_size):
        individual = [random.choice([0, 1]) for _ in range(len(items))]
        population.append(individual)
    return population


# Function to calculate fitness of an individual
def calculate_fitness(individual):
    total_value = 0
    total_weight = 0
    for i in range(len(items)):
        if individual[i] == 1:
            total_value += items[i][1]
            total_weight += items[i][0]
    # Calculate fitness score with penalty for exceeding knapsack capacity
    if total_weight > knapsack_capacity:
        return knapsack_capacity - (total_weight - knapsack_capacity)
    else:
        return total_value


# Function to perform crossover
def crossover(parent1, parent2):
    crossover_point = random.randint(1, len(parent1) - 1)
    child1 = parent1[:crossover_point] + parent2[crossover_point:]
    child2 = parent2[:crossover_point] + parent1[crossover_point:]
    return child1, child2


# Function to perform mutation
def mutate(individual):
    for i in range(len(individual)):
        if random.random() < mutation_rate:
            individual[i] = 1 - individual[i]  # Flip the bit
    return individual


# Main genetic algorithm function
def genetic_algorithm():
    population = create_initial_population()
    best_fitness_per_generation = []
    for _ in range(generations):
        # Calculate fitness for each individual
        fitness_scores = [calculate_fitness(individual) for individual in population]
        best_fitness_per_generation.append(max(fitness_scores))
        # Select parents for crossover
        selected_parents = [population[i] for i in range(len(population))]
        # print(selected_parents)
        fitness_scores1 = [x + 1 for x in fitness_scores]
        parents = random.choices(selected_parents, k=2, weights=fitness_scores1)

        # Perform crossover and mutation
        child1, child2 = crossover(parents[0], parents[1])
        child1 = mutate(child1)
        child2 = mutate(child2)

        # Replace weakest individuals in population with children
        weakest_index = fitness_scores.index(min(fitness_scores))
        population[weakest_index] = child1
        weakest_index = fitness_scores.index(min(fitness_scores))
        population[weakest_index] = child2

    # Plot the improvement of chromosome fitness during generations
    plt.plot(range(generations), best_fitness_per_generation)
    plt.xlabel('Generation')
    plt.ylabel('Best Fitness Score')
    plt.title('Improvement of Chromosome Fitness during Generations')
    plt.show()

    # Return the best solution found
    best_solution_index = fitness_scores.index(max(fitness_scores))
    return population[best_solution_index]


# Run the genetic algorithm
best_solution = genetic_algorithm()
print("Best solution found:", best_solution)