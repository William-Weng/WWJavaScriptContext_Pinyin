function convertPinyin(source, type, toneType) {
    
    let { pinyin } = pinyinPro;
    let format = {type: `${toneType}`, toneType: `${toneType}`};
    let pinyinText = pinyin(source, format);
    
    return pinyinText
}
