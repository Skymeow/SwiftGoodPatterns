if we have multiple value that needs to be passed into completion block, use DispatchGroup.notify:

```
func fetchPartyData(completion: @escaping(_ events: [Event], _ guests: [Guest], _ flowers: [Flower]) -> Void {
    self.fetchEvents()
    self.fetchGuests()
    self.fetchFlowers()
    DispatchGroup().notify {
        completion(self.events, self.guests, self.flowers)
    }
}
```

And in each fetch function: use dispatchGroup to wrap the network request.

```
func fetchEvents() {
    DispatchGroup().enter()
    // network request here
    DispatchGroup().leave()
}
```





 UI action closure don't need capture list, UI action all on main thread
dispatchQueue = DispatchQueue(kind: .serial, label: "serial queue")
If you want to write something to the same resource you are reading, use self.dispatchQueue.sync{ partys.append(parties) }
