function convertPinyin(source, type, toneType) {
    
    let { pinyin } = pinyinPro;
    let format = {type: `${type}`, toneType: `${toneType}`};
    let pinyinText = pinyin(source, format);
    
    return pinyinText
}
