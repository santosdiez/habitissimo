//
//  Cache.swift
//  Habitissimo
//
//  Created by Borja on 31/3/21.
//

import UIKit

private class Wrapper {
    let value: Any

    init(_ value: Any) {
        self.value = value
    }
}

private class KeyWrapper<KeyType: Hashable>: NSObject {
    let key: KeyType

    init(_ key: KeyType) {
        self.key = key
    }

    override var hash: Int {
        return key.hashValue
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? KeyWrapper<KeyType> else {
            return false
        }
        return key == other.key
    }
}

//
// Swift wrapper of NSCache for easier and simpler usage
//
class Cache<KeyType: Hashable, Cacheable> {

    private let cache: NSCache<KeyWrapper<KeyType>, Wrapper> = NSCache()

    var name: String {
        get { return cache.name }
        set { cache.name = newValue }
    }

    var totalCostLimit: Int {
        get { return cache.totalCostLimit }
        set { cache.totalCostLimit = newValue }
    }

    var countLimit: Int {
        get { return cache.countLimit }
        set { cache.countLimit = newValue }
    }

    var evictsObjectsWithDiscardedContent: Bool {
        get { return cache.evictsObjectsWithDiscardedContent }
        set { cache.evictsObjectsWithDiscardedContent = newValue }
    }

    weak var delegate: NSCacheDelegate? {
        get { return cache.delegate }
        set { cache.delegate = newValue }
    }

    init(lowMemoryAware: Bool = true) {
        guard lowMemoryAware else { return }
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onLowMemory),
            name: UIApplication.didReceiveMemoryWarningNotification,
            object: nil)
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    @objc private func onLowMemory() {
        removeAllObjects()
    }

    func object(forKey key: KeyType) -> Cacheable? {
        return cache.object(forKey: KeyWrapper(key))?.value as? Cacheable
    }

    func setObject(_ obj: Cacheable?, forKey key: KeyType) {
        guard let obj = obj else {
            removeObject(forKey: key)
            return
        }
        return cache.setObject(Wrapper(obj), forKey: KeyWrapper(key))
    }

    func setObject(_ obj: Cacheable?, forKey key: KeyType, cost: Int) {
        guard let obj = obj else {
            removeObject(forKey: key)
            return
        }
        return cache.setObject(Wrapper(obj), forKey: KeyWrapper(key), cost: cost)
    }

    func removeObject(forKey key: KeyType) {
        return cache.removeObject(forKey: KeyWrapper(key))
    }

    func removeAllObjects() {
        return cache.removeAllObjects()
    }
}
