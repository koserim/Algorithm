import Foundation

struct Truck {
    var weight: Int
    var time: Int
}


func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    var trucks = truck_weights
    var time = 1
    var currentTrucks: [Truck] = []
    let truck = Truck(weight: trucks.removeFirst(), time: 0)
    currentTrucks.append(truck)
    var currentWeight = truck.weight
    
    let appendTruck: () -> () = {
        time += 1
        for i in 0..<currentTrucks.count {
            currentTrucks[i].time += 1
        }
        if(currentTrucks[0].time == bridge_length) {
            currentWeight -= currentTrucks[0].weight
            currentTrucks.removeFirst()
        }
    }
    
    while(!trucks.isEmpty) {
        appendTruck
        if(trucks.isEmpty) { continue }
        if(currentWeight + trucks[0] > weight) {
            continue
        } else {
            currentWeight += trucks[0]
            currentTrucks.append(Truck(weight: trucks.removeFirst(), time: 0))
        }
    }
    while(!currentTrucks.isEmpty) { appendTruck }
    return time
}
