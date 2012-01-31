import com.fycd.contact.*

def results = TaoMember.findAllByIdInList([2l,3l,4l])
results.each {
    println it
}

println "next"

def user = TaoMember.findByUsername("tchou")
def qr = TaoMember.executeQuery("select distinct m.id from TaoMember m where m.introducer = :user or m.guarantor = :user or m.contactPerson = :user",
                        [user: user])
qr.each {
    println it
}
