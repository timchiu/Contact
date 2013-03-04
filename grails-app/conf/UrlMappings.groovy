import org.apache.jasper.tagplugins.jstl.core.Redirect;

class UrlMappings {

	static mappings = {
		"/reports/pauline"(controller: "report", action: "pauline")
		"/reports/getSqlUpdates"(controller: "report", action: "getSqlUpdates")
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
//		"/"(controller:"redirect", action:"home")
		"500"(view:'/error')
	}
}
