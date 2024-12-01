void main(){

}

abstract class ServiceApi{
  void apiPost();
  void apiGet();
}

class WorkApi extends ServiceApi{
  @override
  void apiGet() {
  }

  @override
  void apiPost() {
  }

}