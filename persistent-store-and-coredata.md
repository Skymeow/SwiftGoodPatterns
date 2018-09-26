[https://useyourloaf.com/blog/cleaning-up-core-data-fetch-requests/](https://useyourloaf.com/blog/cleaning-up-core-data-fetch-requests/)

always use fetch result manager to separte coredata logic from view logic

or map nsmanagedobject into generic model

[https://vimeo.com/140037432](https://vimeo.com/140037432)





### convert file from bundle to data and save to application support directory and retrieve it:

```
// pages file for demo
    private func readDataFromFile() -> Data?{
        guard let url = Bundle.main.url(forResource: "sample", withExtension: "pages") else { return nil }
        do {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
            return data
        } catch let err {
            print(err)
            return nil
        }
    }
    
    private func saveDataToFile() {
        guard let data = self.readDataFromFile() else { return }
        let directory = NSSearchPathForDirectoriesInDomains(.applicationSupportDirectory, .userDomainMask, true)[0]
        do {
            try fileManager.createDirectory(atPath: directory, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error)
        }
        
        let pathUrl = URL(fileURLWithPath: directory, isDirectory: true)
        let attachmentPath = pathUrl.appendingPathComponent("attachment")
        do {
            try fileManager.createDirectory(atPath: attachmentPath.path, withIntermediateDirectories: true, attributes: nil)
        } catch {
            print(error)
        }
        
        let fileUrl = attachmentPath.appendingPathComponent("test3.pages")
        fileManager.createFile(atPath: fileUrl.path, contents: data, attributes: nil)
        do {
            try data.write(to: fileUrl)
        } catch {
            print(error)
        }
    }
    
    private func getFileUrl() {
        let url = fileManager.urls(for: .applicationSupportDirectory, in: .userDomainMask).first
        
        let fileUrl  = url?.appendingPathComponent("attachment").appendingPathComponent("test3.pages")
        guard let path = fileUrl?.path else { return }
        if fileManager.fileExists(atPath: path) {
            self.resouce = .pages
            self.previewItem = fileUrl as! QLPreviewItem
            DispatchQueue.main.async {
                self.present(self.previewController, animated: true)
            }
        }
    }
```



