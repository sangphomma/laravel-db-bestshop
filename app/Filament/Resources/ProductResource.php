<?php

namespace App\Filament\Resources;

use App\Filament\Resources\ProductResource\Pages;
use App\Filament\Resources\ProductResource\RelationManagers;
use App\Models\Product;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\MarkdownEditor;
use Filament\Forms\Components\Select;
use Filament\Forms\Components\Tabs;
use Filament\Forms\Components\Tabs\Tab;
use Filament\Forms\Components\TagsInput;
use Filament\Forms\Components\TextInput;
use Filament\Forms\Components\Toggle;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Columns\TextColumn;
use Filament\Tables\Columns\ToggleColumn;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Illuminate\Support\Str;
use Livewire\Features\SupportFileUploads\TemporaryUploadedFile;

class ProductResource extends Resource
{
    protected static ?string $model = Product::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
        ->schema([
            Tabs::make('Product ')->tabs([
                Tab::make('info')->schema([
                    TextInput::make('name')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->live(onBlur:true)
                    ->afterStateUpdated(function($operation, $state, Forms\set $set){
                                if($operation !=='create') return ;

                                $set('slug', Str::slug($state).'-Update-'.Str::slug(date('d-M-Y', now()->timestamp)) ) ;
                    }),
                    TextInput::make('price')->numeric(),
                    TextInput::make('slug'),
                    Select::make('category_id')->label('Category')
                    ->relationship('category', 'name')
                    ->searchable()
                    ->preload() ,
                    Select::make('brand_id')->label('Brand')
                    ->relationship('brand', 'name')
                    ->searchable()
                    ->preload() ,
                    TagsInput::make('tags'),
                    Toggle::make('published')->default(true),
                    MarkdownEditor::make('excerpt')->columnSpan(2),
                    MarkdownEditor::make('desc')->columnSpan(2),
                ])->columns(2),
                Tab::make('cover')->schema([
                    FileUpload::make('cover')->label('Screen Short')
                    ->directory('products-cover-images')
                    ->getUploadedFileNameForStorageUsing(
                        function(TemporaryUploadedFile $file , Forms\Get $get){
                            if($get('slug')!==''){
                                $fname=$get('slug') ;
                            }else{
                                $fname='product' ;
                            }
                            return 'cover-'.$fname.'-'.str(now()->timestamp).'.'.str($file->getClientOriginalExtension()) ;
                        }
                    )
                    ->image()
                    ->imageEditor(),
                ]),
                Tab::make('images')->schema([
                    FileUpload::make('images')->label('Screen Short')
                    ->directory('products-images')
                    ->multiple()
                    ->storeFileNamesIn('attachment_file_names')
                    ->image()
                    ->imageEditor(),
                ])


            ])
        ])->columns(1);
    }

    public static function table(Table $table): Table
    {
        return $table
        ->columns([

            TextColumn::make('name')
                ->searchable(),
            TextColumn::make('category.name'),
            ImageColumn::make('brand.images')->circular()->size(60)->stacked(),
            ImageColumn::make('images')->circular()->size(60)->stacked()->limit(3),
            ToggleColumn::make('published'),
            TextColumn::make('created_at')
                ->dateTime()->since()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
            TextColumn::make('updated_at')
                ->dateTime()->since()
                ->sortable()
                ->toggleable(isToggledHiddenByDefault: true),
        ])
            ->filters([
                //
            ])
            ->actions([
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListProducts::route('/'),
            'create' => Pages\CreateProduct::route('/create'),
            'edit' => Pages\EditProduct::route('/{record}/edit'),
        ];
    }
}
