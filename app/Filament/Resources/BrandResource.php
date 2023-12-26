<?php

namespace App\Filament\Resources;

use App\Filament\Resources\BrandResource\Pages;
use App\Filament\Resources\BrandResource\RelationManagers;
use App\Models\Brand;
use Filament\Forms;
use Filament\Forms\Components\FileUpload;
use Filament\Forms\Components\MarkdownEditor;
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

class BrandResource extends Resource
{
    protected static ?string $model = Brand::class;

    protected static ?string $navigationIcon = 'heroicon-o-rectangle-stack';

    public static function form(Form $form): Form
    {
        return $form
        ->schema([
            Tabs::make('Category ')->tabs([
                Tab::make('info')->schema([
                    TextInput::make('name')
                    ->required()
                    ->unique(ignoreRecord: true)
                    ->live(onBlur:true)
                    ->afterStateUpdated(function($operation, $state, Forms\set $set){
                                if($operation !=='create') return ;

                                $set('slug', Str::slug($state).'-Update-'.Str::slug(date('d-M-Y', now()->timestamp)) ) ;
                    }),
                    TextInput::make('slug'),
                    TagsInput::make('tags'),
                    Toggle::make('published')->default(true),
                    MarkdownEditor::make('desc')->columnSpan(2),
                ])->columns(2),
                Tab::make('images')->schema([
                    FileUpload::make('images')->label('Screen Short')
                    ->directory('brands-images')
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
            ImageColumn::make('images')->circular()->size(60)->stacked(),
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
            'index' => Pages\ListBrands::route('/'),
            'create' => Pages\CreateBrand::route('/create'),
            'edit' => Pages\EditBrand::route('/{record}/edit'),
        ];
    }
}
