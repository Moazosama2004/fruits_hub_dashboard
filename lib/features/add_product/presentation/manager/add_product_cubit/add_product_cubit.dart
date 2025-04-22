import 'package:bloc/bloc.dart';
import 'package:fruits_hub_dashboard/core/repos/images_repo/images_repo.dart';
import 'package:fruits_hub_dashboard/core/repos/products_repo/products_repo.dart';
import 'package:fruits_hub_dashboard/features/add_product/domain/entities/product_entity.dart';
import 'package:meta/meta.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  // AddProductCubit(this.imagesRepo, this.productsRepo)
  AddProductCubit(this.productsRepo, this.imagesRepo)
    : super(AddProductInitial());
  final ImagesRepo imagesRepo;
  final ProductsRepo productsRepo;

  addProduct({required ProductEntity inputEntity}) async {
    emit(AddProductLoading());
    var result = await imagesRepo.uploadImage(image: inputEntity.image);
    result.fold(
      (failure) => emit(AddProductFailure(errMessage: failure.errMessage)),
      (url) async {
        inputEntity.imageUrl = url;
        var result = await productsRepo.addProduct(inputEntity: inputEntity);
        result.fold(
          (failure) => emit(AddProductFailure(errMessage: failure.errMessage)),
          (r) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
