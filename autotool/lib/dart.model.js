exports.exportModel = function exportModel(classConfig) {
    let body = "";
    if (classConfig.packages) {
        for (const package of classConfig.packages) {
            body = body + `import '${package}';\n`;
        }
    }
    if (classConfig.name) {
        body = body + `class ${classConfig.name} extends BaseModel\n`;
        body = body + `{\n`;
        if (classConfig.fields) {
            body = body + buildBodys(classConfig.fields,classConfig.name);
        }
    }
    return body;
}

function buildBodys(fields,name) {
    let fieldBody = buildFieldBody(fields);
    let constructorBody = buildConstructorBody(fields,name);
    let initWithMapMethod = `
  @override
  void initWithMap(Map<String, Object?> map) {
  
${buildInitWithMapMethodBody(fields)}  }\n`;
    
    let toMapMethod = `
  @override
  Map<String, Object?> toMap() {
${buildToMapMethodBody(fields)}  }\n`;

    return fieldBody + constructorBody + initWithMapMethod + toMapMethod +`}`
}

function buildFieldBody(fields) {
    let fieldBody = "";
    for (const field of fields) {
        if (field.type && field.name) {
            console.log(field);
            const final = field.final==true? 'final ' : '';
            const type = field.listType==undefined ? `${field.type}`:`${field.type}<${field.listType}>`;
            const option = field.option==true? `${type}? ` : `${type} `;
            let isListEnd = field.type === "List" ? `=[]`:``;
            fieldBody = fieldBody +
            `  ${final}${option}${field.name}${isListEnd};\n`;
        }
    }
    return fieldBody;
}

function buildConstructorBody(fields, name) {
    let constructorBody = `\n  ${name}({\n`;
    for (const field of fields) {
        if (field.type && field.name) {
            console.log(field);
            if(field.type === 'List'){
                continue;
            }
            const required = field.required==true? 'required ' : '';
            const fieldBody = `this.${field.name}`
            const defaultValue = field.default!=undefined?` = ${field.default}`:``;
            constructorBody = constructorBody +
            `    ${required}${fieldBody}${defaultValue},\n`;
        }
    }
    return constructorBody+`  });\n`;
}

function buildInitWithMapMethodBody(fields){
    let methodBody = "";
    for (const field of fields) {
        if (field.type && field.name) {
            console.log(field);
            if(field.doConvert===false){
                continue;
            }
            const key = field.key || field.name;
            const mapType = field.mapType || field.type;
            const ifBefore  = `    if (map["${key}"] is ${mapType}) {\n`;
            if(field.type === "List"){
                const datas     = `      final Object? ${field.name}Datas = map["${key}"];\n`;
                const forStart  = `      for(final ${field.name}Data in ${field.name}Datas as List){\n`;
                let params    = "";
                for(const param of field.listTypeParams){
                    console.log(param);
                    params =  `${params}${param.key}: ${field.name}Data["${param.mapKey}"],`;
                }
                const toMap     = `        this.${field.name}.add(${field.listType}(${params})..initWithMap(${field.name}Data));\n`;
                const forEnd    = `      }`;
                const ifAfter   = `\n    }\n\n`;
                methodBody = methodBody + ifBefore + datas + forStart + toMap + forEnd + ifAfter;
            }else{
                const fieldBody = `      this.${field.name} `;
                const keyBody   = field.keyCode || `= map["${key}"] as ${field.type};`;
                const ifAfter   = `\n    }\n\n`;
                methodBody = methodBody + ifBefore + fieldBody + keyBody + ifAfter;
            }
        }
    }
    return methodBody;
}

function buildToMapMethodBody(fields){
    let methodBody = "";
    const createMap            = `     final map = Map<String, Object?>();\n`;
    methodBody = methodBody + createMap;
    for (const field of fields) {
        if (field.type && field.name) {
            console.log(field);
            if(field.doMap===false){
                continue;
            }
            const key = field.key || field.name;
            if(field.type === "List"){
                const creatMap  = `     List<Map> ${field.name}List = [];\n`;
                const forStart  = `     for(final object in this.${field.name}){\n`
                const forBody   = `       ${field.name}List.add(object.toMap());\n` 
                const forEnd    = `     }\n`;
                const addToMap  = `     map["${key}"]= ${field.name}List;\n`;
                console.log(`=============creatMap:${creatMap}`)
                methodBody = methodBody + creatMap + forStart + forBody + forEnd + addToMap;
            }else{
                const toMapCode  = field.toMapCode || `= this.${field.name};`;
                const fieldBody  = `    map["${key}"] ${toMapCode}\n`;
                methodBody = methodBody + fieldBody;
            }

        }
    }
    const endMap                 =`     return map;\n`;
    return methodBody+endMap;
}