enum Sizes{
  XS,
  SM,
  LG,
  MD,
  XL,
}

printSize(Sizes size) {
  switch(size){
    case Sizes.XS :
      return 'XS';
      break;
    case Sizes.SM:
      return 'SM';
      break;
    case Sizes.LG:
      return 'LG';
      break;
    case Sizes.MD:
      return 'MD';
      break;
    case Sizes.XL:
      return 'XL';
      break;
  }
}